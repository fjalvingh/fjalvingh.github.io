# HP1640A Serial Data Analyzer

Gotten from Domaine d’Espitalet inheritance.

![image-20240707-123812.png](./attachments/image-20240707-123812.png)

The machine was dirty but quite complete.

# Internals

![image-20240707-123949.png](./attachments/image-20240707-123949.png)

The power supply is a linear one and has some nice large elco’s:

![image-20240707-124121.png](./attachments/image-20240707-124121.png)

These were removed and tested, and all of them tested fine. I removed them and reformed them for 8 hours so that they get used to being under power again.

![image-20240707-124445.png](./attachments/image-20240707-124445.png)

![image-20240707-124534.png](./attachments/image-20240707-124534.png)

![image-20240707-124741.png](./attachments/image-20240707-124741.png)

![image-20240707-124851.png](./attachments/image-20240707-124851.png)

![image-20240707-125049.png](./attachments/image-20240707-125049.png)

![image-20240707-125133.png](./attachments/image-20240707-125133.png)

![image-20240707-125331.png](./attachments/image-20240707-125331.png)

![image-20240707-125509.png](./attachments/image-20240707-125509.png)

The main CPU is an AM9080, a 8080 clone (1820-2006).

# Initial startup

After cleaning the machine started but with an error message:

![image-20240707-165052.png](./attachments/image-20240707-165052.png)

U32 was a socketed chip with the HP number 1818-0348 which should be an AM9102DPC, a 1024x1 bit static RAM. Swapping the chip on other places where it is used follows the chip around so it is the chip..