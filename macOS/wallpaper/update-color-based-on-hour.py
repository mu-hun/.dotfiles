import datetime
import subprocess

COLORS = [
    "0f0f0f",
    "0f0f0f",
    "131313",
    "171717",
    "131313",
    "232323",
    "3e3e3e",
    "676767",
    "afafaf",
    "cacaca",
    "e1e1e1",
    "dedede",
    "dedede",
    "dedede",
    "d4d4d4",
    "b7b7b7",
    "a6a6a6",
    "888888",
    "515151",
    "363636",
    "303030",
    "343434",
    "202020",
    "0f0f0f",
]


if __name__ == "__main__":
    now = datetime.datetime.now()
    subprocess.run(["/usr/local/bin/desktoppr", "color", COLORS[now.hour]])
