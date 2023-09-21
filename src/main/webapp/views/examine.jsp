<%--
  Created by IntelliJ IDEA.
  User: only
  Date: 2022/6/30
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CiliCili-全宇宙最大的视频站-视频审核</title>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
    <script src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="/views/js/axios.min.js"></script>
</head>
<body>
<div id="header"></div>
<div id="app"></div>
<template id="navi">
    <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal">
        <el-menu-item index="1">视频审核</el-menu-item>
    </el-menu>
</template>
<template id="tab">
    <el-table
            v-loading="loading"
            element-loading-text="拼命加载中"
            element-loading-spinner="el-icon-loading"
            element-loading-background="rgba(0, 0, 0, 0.8)"
            :data="tableData"
            border
            style="width: 100%">
        <el-table-column
                fixed
                prop="vid"
                label="VID"
                width="100">
        </el-table-column>
        <el-table-column
                prop="vtitle"
                label="标题"
                width="150">
        </el-table-column>
        <el-table-column
                prop="vpart"
                label="视频分区"
                width="150">
        </el-table-column>
        <el-table-column
                prop="vinfo"
                label="视频详情"
                width="300">
        </el-table-column>
        <el-table-column
                prop="vowner"
                label="视频作者"
                width="100">
        </el-table-column>
        <el-table-column
                prop="uptime"
                label="上传时间"
                width="200">
        </el-table-column>
        <el-table-column
                prop="vviews"
                label="浏览量"
                width="100">
        </el-table-column>
        <el-table-column
                prop="videofile"
                label="视频文件"
                width="100">
        </el-table-column>
        <el-table-column
                prop="vimage"
                label="视频封面"
                width="100">
        </el-table-column>
        <el-table-column
                prop="vlikes"
                label="点赞量"
                width="100">
        </el-table-column>
        <el-table-column
                prop="vcoins"
                label="投币量"
                width="100">
        </el-table-column>
        <el-table-column
                prop="vcolnum"
                label="收藏量"
                width="100">
        </el-table-column>
        <el-table-column
                fixed="right"
                label="操作"
                width="100">
            <template slot-scope="scope">
                <el-button @click="pass(scope.row)" type="text" size="small">通过</el-button>
                <el-button @click="notpass(scope.row)" type="text" size="small">不通过</el-button>
            </template>
        </el-table-column>
    </el-table>
</template>

<script>
    let head = new Vue({
        el:"#header",
        template: "#navi"
    });
    let vm = new Vue({
        el:"#app",
        methods: {
            test() {
                axios.get('/restExamine', {
                    params: {
                    }
                }).then(response => {
                        console.log(response)
                        console.log(response.data)
                        this.tableData = response.data;
                    }).catch(response => {
                    this.$message.error('网络错误');
                });
            },
            pass(row) {
                console.log(row);
                axios.get('/examinePass', {
                    params: {
                        vid:row.vid
                    }
                }).then(response => {
                        console.log(response)
                        console.log(response.data)
                        if (response.data=="success") {
                            this.$message({
                                message: '通过',
                                type: 'success'
                            });
                            this.test();
                        }
                        else {
                            this.$message.error('数据库错误');
                        }
                    }).catch(response => {
                        this.$message.error('网络错误');
                    });
            },
            notpass(row) {
                console.log(row);
                axios.get('/examineNotPass', {
                    params: {
                        vid:row.vid
                    }
                }).then(response => {
                        console.log(response)
                        console.log(response.data)
                        if (response.data=="success") {
                            this.$message("不通过");
                            this.test();
                        }
                        else {
                            this.$message.error('数据库错误');
                        }
                    }).catch(response => {
                        this.$message.error('网络错误');
                    });
            }
        },
        mounted() {
            this.test();
        },
        data() {
            return {
                tableData: []
            }
        },
        template:"#tab"//通过该属性可以将自定义的template属性中的内容全部替换app的内容，并且会覆盖里面原有的内容，并且在查看dom结构时没有template标签
    });


</script>
</body>
</html>
