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
###### uses [Dinnerbone/mcstatus](https://github.com/Dinnerbone/mcstatus)
