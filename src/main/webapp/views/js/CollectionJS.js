
        var uid = document.querySelector('#uid').value; //获取  视频ID
        $.post("/getRichCol", {"uid": uid}, function (r) {
            var thtml="<tr><th>时间</th><th>视频标题</th><th>视频封面</th><th>视频作者</th><th>视频详情</th></tr>";
            for (var i=0;i<r.length;i++){
             thtml +="<tr><td>"+r[i].coltime+"</td><td>"+r[i].vtitle+"</td><td>"+r[i].vimage+"</td><td>"+r[i].nickname+"</td><td>"+r[i].vinfo+"</td></tr>";
        }
            $('table:eq(0)').html(thtml);
        })
