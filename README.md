# rails-passenger-docker

The great problem is alter the max_user_watches.
A lot of blogs/sites has a lot of 'opinions' but just this work for me.

```
First create your container.
```

For custom that, you can exec this step:

```
docker run --rm --privileged --entrypoint sysctl CONTAINER_NAME -w fs.inotify.max_user_watches=524288
```

Then exec the compose again 

```
docker-compose up
```

Enjoy fletchas :D
