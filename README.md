# curator-plus
>elasticsearch indices housekeeper, one curator instance housekeep all es instances' indices.

## Requirement
Maybe you have one elasticsearch instanse or more than one (I mean different cluster), here you need to setup one or more than one curator instance, which is not complated. if you have more and more instance, you need a all-in-one curator image like this.

## Getting Started

1. Clone git folder: `git clone https://github.com/easonlau02/curator-plus.git`
2. You need to change the action file under `action_file` folder, default file is to trim 14 days by age, you can use it for all instanse or create different yml file for every es instance. 
3. Create `curator config for every es instance` under `curator` folder, you only need to substitute the es's hostname, here has a file default as localhost, unlike step 2, you must to create every `curator config` for every es's instance(if they use different action file)
4. Per step 2 & 3, please remember the file name(yes, only file name), and substitute `action file name`/`curatonr config name`under  cronjob file under `cronjob` folder
```
0 12 * * *  curator --config /repo/curator/<action file name1>.yml  /repo/action_file/<curator config name1>.yml >> /var/log/curator/curator.log 2>&1
```
5. Also if you have more than one es's instance(different cluster), you can supplement one more cronjob under step 5, like
```
0 12 * * *  curator --config /repo/curator/<action file name1>.yml  /repo/action_file/<curator config name1>.yml >> /var/log/curator/curator.log 2>&1
0 13 * * *  curator --config /repo/curator/<action file name2>.yml  /repo/action_file/<curator config name2>.yml >> /var/log/curator/curator.log 2>&1
```
6. Build new image by command under git folder
```
chmod +x build_curator_image.sh
./build_curator_image.sh
```
7. Running image by docker-compose.yml
```
docker-compose up -d
```
8. Status
```
CONTAINER ID        IMAGE                        COMMAND                CREATED             STATUS              PORTS               NAMES
2d4e84fd42f8        eason02/curator-plus:5.2.0   "/repo/startcron.sh"   2 seconds ago       Up 1 seconds                            curator-plus-5.2.0
```

## Customized image by your Dockerfile
```
FROM eason02/curator-plus:latest
```

## Feedback and new requirement
1. Fork it (https://github.com/easonlau02/curator-plus/fork)
2. Comment below/requirement or [raise issue](https://github.com/easonlau02/curator-plus/issues)
