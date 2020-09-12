
PROXY_ADDR=$(route -4 | awk '/^default/ {print $2}')
PROXY_PORT_HTTP=8118
ProxyAddr=$PROXY_ADDR:$PROXY_PORT_HTTP

export http_proxy="http://$ProxyAddr"
export https_proxy=$http_proxy

alias curl="curl -x $ProxyAddr"

git config --global http.proxy $http_proxy
git config --global https.proxy $http_proxy
git config --global http.lowSpeedLimit 1000
git config --global http.lowSpeedTime 600

BOTOCFG=~/.boto
echo "[boto]" > ${BOTOCFG}
echo "proxy=${PROXY_ADDR}" >> ${BOTOCFG}
echo "proxy_port=${PROXY_PORT_HTTP}" >> ${BOTOCFG}
export NO_AUTH_BOTO_CONFIG=${BOTOCFG}

