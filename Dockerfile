FROM       node
ADD        mkdir /app
WORKDIR    /app
ADD        node-modules/ /app/node-modules/
ADD        schema/ /app/schema/
ADD        DbConfig.js index.js package.json TransactionService.js /app/
ENTRYPOINT ["node" , "/app/index.js"]