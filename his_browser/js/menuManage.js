getAllMenu()

let data

function getAllMenu() {
    axios({
        url: '/sysManage/getSysMenu',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        renderTree(res.data.data)
        
    });
}

function renderTree(data) {
    layui.use(['tree', 'util'], function () {
        let tree = layui.tree,
            layer = layui.layer,
            util = layui.util
        
        tree.render({
            elem: '#test1',
            data: data
        });
    });
}

function renderTable() {
    
}