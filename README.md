# crypto-print-money

Here is how to run the container.

## clone the repository on your local PC
if you don't have git, you need to install it

```
git clone https://github.com/fciannel/crypto-print-money.git
```

## build the container
You need to run this from inside the directory that you downloaded with git

```
docker build -t crypto_print_money:0.0.1 -t crypto_print_money:latest .
```

## run the container

In the below command, instead of <local_dir> you need to write the path to a directory in your windows. This can be something like "C:\Users\Whatever"

```
docker run -d -ti --name crypto_print_money -v <local_dir>:/tmp -h crypto_print_money crypto_print_money:latest python main.py
```

Once you run the docker command, then you will see into "C:\Users\Whatever"

a file called "logfile.log"

That file contains the information coming from binance

## stopping the container

If you want to change something in the code, you can run this:

```
docker stop crypto_print_money
docker rm crypto_print_money
```
you can then change the code and finally build and run again

