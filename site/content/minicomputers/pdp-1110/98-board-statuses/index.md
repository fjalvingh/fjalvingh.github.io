# PDP 11/05 Board statuses

This lists all boards that I have examined and their "working status", as far as known.

## Complete working configurations

| Date | Combination |
| ---- | ----------- |
| 2026-10-17 | M7260#3, M7261#2, G109#1, G231#1, H214#1 |





## M7260

| Board | Since | Status |
| ---- | ---- | ---- |
| #3   | 2026-10-17 | First board that worked (Rev.E) |

## M7261

| Board | Since | Status |
| ---- | ---- | ---- |
| #1 (E) | 2026-10-17 | [Defective; halts with PC=0](../80-board-repairs/10-m7261-1/index.md) |
| #2 (E) | 2026-09-22 | Seems to be working |

## G109 (G110)

| Board | Since | Status |
| ---- | ---- | ---- |
| #1 | 2026-09-22| Address 0, seems to work: exam + deposit |
| #2 | 2026-09-22 | Address 0, SSYN not responding, board gets very hot! | 
| #3 | 2026-09-22 | Address 040000, SSYN responds but all bits always read as 1. Bus is not stuck, and it is not (yet) the core rewrite: initial reads of a new address are all ones too. | 
| #4 | 2003-10-17 | | Marked as defective: bit 8 stuck at 0 |


## G231

| Board | Since | Status |
| ----  | ---- | ---- |
| #1    | 2026-10-17 | Working |

## H214

| Board | Since | Status |
| ----  | ---- | ---- |
| #1    | 2026-10-17 | Working |



