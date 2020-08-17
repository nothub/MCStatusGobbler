from mcstatus import MinecraftServer


def pollstatus(address):

    status = None

    try:
        status = MinecraftServer.lookup(address).status()
    except:
        pass

    if status:
        players = status.players.online
        latency = status.latency
    else:
        players = -1
        latency = -1

    return str("{0},{1},{2}".format(address, players, latency))


if __name__ == '__main__':

    import sys

    if len(sys.argv) != 2:
        print("no address specified!")
        sys.exit(1)

    print(pollstatus(sys.argv[1]))
