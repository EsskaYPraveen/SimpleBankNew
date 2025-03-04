package main

import (
	"database/sql"
	"learngo/simplebank/api"
	"learngo/simplebank/db"
	"learngo/simplebank/util"
	"log"

	_ "github.com/lib/pq"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
        log.Fatal("cannot load config:", err)
    }
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("can't connect to DB", err)
	}
	store := db.NewStore(conn)
	server := api.NewServer(store)
	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start Server", err)
	}

}
