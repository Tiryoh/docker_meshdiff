#!/bin/sh

USER_ID=${UID:-1000}
GROUP_ID=${GID:-1000}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
addgroup -g ${GROUP_ID} user
adduser -D -u ${USER_ID} -G user user
export HOME=/home/user


if [ -d /work ]; then
    if [ -d /work/refs ] && [ -d /work/objects ]; then # if git repo
        cd /work && /sbin/su-exec user /unpack-objects.sh
        sed -e 's/name="TargetName" value=""/name="TargetName" value="target_repo"/' -i /usr/share/nginx/html/index.html
        ln -s /work /usr/share/nginx/html/target/target_repo
    else
        rm -rf /usr/share/nginx/html/target
        ln -s /work /usr/share/nginx/html/target
    fi
fi

/docker-entrypoint.sh

exec "$@"