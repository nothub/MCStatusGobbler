```
docker build -t dev .
docker run --rm -v $(pwd)/volume:/vol --name gobbler dev
```
needs servers.txt in volume dir, 1 host per line.

---

###### uses Dinnerbones [mstatus](https://github.com/Dinnerbone/mcstatus)
