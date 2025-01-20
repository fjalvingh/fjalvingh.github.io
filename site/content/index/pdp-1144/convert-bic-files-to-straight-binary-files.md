# Convert BIC files to straight binary files

XXDP’s BIC files are record based. To be able to disassemble them it is better to have straight binaries.

The record format of a BIC file is:

- Byte 1 - Contains a value of 1 to indicate starting point.
- Byte 2 - Contains a value of 0. This must follow byte 1.
- Bytes 3 and 4 - Contains number of bytes (N) in this binary block. It includes bytes 1, 2, 3 and 4 but excludes the checksum byte.
- Byte 5 and 6 - Contains the starting memory address where the following data bytes are to be stored.
- Byte 7 to N - Data bytes. N <= 509. The maximum number of data bytes is 503.
- Byte N+1 - Contains the checksum byte. The checksum is the two's complement of the sum of the data in all N bytes. It is generated ignoring overflow and carry conditions.

The end of a binary file is indicated by a binary block that has a byte count of 6. Bytes 5 and 6 contain

the program's transfer address, this block is known as the 'transfer block'.

The following Java program converts those files:

```
package to.etc.dec.tu58.bicreader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 * Reads .bic files and creates a binary only image of its contents.
 */
public class BicReader {
	private final InputStream m_is;

	private int m_offset;

	private int m_end;

	private final byte[] m_memory = new byte[64 * 1024];

	public BicReader(InputStream is) {
		m_is = is;
	}

	static public void main(String[] args) throws Exception {
		if(args.length != 1) {
			System.err.println("Usage: BicReader [file]");
			System.exit(10);
		}

		BicReader bicReader;
		try(InputStream is = new FileInputStream(new File(args[0]))) {
			bicReader = new BicReader(is);
			bicReader.run();
		}

		String nwName = args[0];
		int last = nwName.lastIndexOf('.');
		if(last != -1) {
			nwName = nwName.substring(0, last);
		}
		nwName += ".bin";
		try(FileOutputStream fos = new FileOutputStream(new File(nwName))) {
			fos.write(bicReader.m_memory, 0, bicReader.m_end);
		}
		System.out.println("Wrote " + bicReader.m_end + " bytes to " + nwName);
	}

	private void run() throws Exception {
		for(;;) {
			int newEnd = readBlock();
			if(newEnd == -1) {
				break;
			}
			if(newEnd > m_end) {
				m_end = newEnd;
			}
		}

	}

	/**
	 * Format:
	 * <pre>
	 *	Byte 1 - Contains a value of 1 to indicate starting point.
	 * 	Byte 2 - Contains a value of 0. This must follow byte 1.
	 * 	Bytes 3 and 4 - Contains number of bytes (N) in this binary block. It includes bytes 1, 2, 3
	 *  		and 4 but excludes the checksum byte.
	 *	Byte 5 and 6 - Contains the starting memory address where the following data bytes are
	 *		to be stored.
	 *	Byte 7 to N - Data bytes. N <= 509. The maximum number of data bytes is 503.
	 *	Byte N+1 - Contains the checksum byte. The checksum is the two's complement of the sum
	 *  	of the data in all N bytes. It is generated ignoring overflow and carry conditions.
	 * </pre>
	 */
	private int readBlock() throws Exception {
		int b = m_is.read();
		if(b == -1) {
			return -1;
		}
		m_offset++;
		if(b != 1) {
			error("Invalid record start byte: 0x" + Integer.toHexString(b));
		}
		b = read();
		if(b != 0)
			error("Invalid record 2nd byte: 0x" + Integer.toHexString(b));

		int len = readWord();
		if(len > 509 || len < 6)
			error("Invalid data length " + len + ", expecting len <= 509 and >= 6");
		int start = readWord();
		len -= 6;
		if(len == 0)
			return -1;								// End of file

		if(start + len > m_memory.length)
			error("start address 0x" + Integer.toHexString(start) + " and len 0x" + Integer.toHexString(len) + " overflows 64K");
		int bytes = m_is.read(m_memory, start, len);
		if(bytes != len)
			error("Failed to read " + len + " bytes, got " + bytes);
		m_offset += bytes;
		int sum = read();						// Forget about the sum

		System.out.println("Loaded 0x"
			+ Integer.toHexString(len)
			+ " (0" + Integer.toOctalString(len) + " oct)"
			+ " bytes at 0x"
			+ Integer.toHexString(start)
			+ " (0" + Integer.toOctalString(start) + " oct)"
		);
		return start + len;
	}

	private int readWord() throws Exception {
		int w = read();
		int v = read();
		return w | (v << 8);
	}

	private int read() throws Exception {
		int r = m_is.read();
		if(r == -1) {
			error("Unexpected end of file");
		}
		return r & 0xff;
	}

	private void error(String s) {
		throw new RuntimeException(s + " at offset 0x" + Integer.toHexString(m_offset));
	}
}

```