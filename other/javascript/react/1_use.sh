# tips
    如果我们需要使用 JSX，则 <script> 标签的 type 属性需要设置为 text/babel。

# install 
    # source 
        # 设置源泉来淘宝
            npm install -g cnpm --registry=https://registry.npm.taobao.org
            npm config set registry https://registry.npm.taobao.org
    # install 
            npm install react
            npm install -g create-react-app
            create-react-app my-app  # 创建项目到my-app

# command 
    cd my-app  # go into the my-app with create-react-app create
    npm run build # bundles the app into static files for production.
    npm start  # start the development server
    npm test   # starts the test runner.

#  React 组件 api
    设置状态：setState
    替换状态：replaceState
    设置属性：setProps
    替换属性：replaceProps
    强制更新：forceUpdate
    获取DOM节点：findDOMNode
    判断组件挂载状态：isMounted

