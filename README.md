```
./run.sh
```
or
```
docker build -t dev .
docker run --rm -v $(pwd)/log:/log --name gobbler dev
```
needs `servers.txt` in workdir, 1 host per line.

---
###### uses Dinnerbones [mstatus](https://github.com/Dinnerbone/mcstatus)
