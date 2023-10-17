#!/bin/bash

wget https://jaspar.elixir.no/download/database/JASPAR2024.sql.gz
gunzip -c JASPAR2024.sql.gz | sqlite3 JASPAR2024.sqlite
