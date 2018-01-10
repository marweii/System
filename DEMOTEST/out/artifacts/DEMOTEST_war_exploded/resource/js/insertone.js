function insertOne() {
    if($("#idname").val()!=null&&$("#idname").val()!=""&&$("#comname").val()!=null&&$("#comname").val()!=""&&$("#disname").val()!=null&&$("#disname").val()!="") {
        $("#mainForm").attr("action", "/insertOneServlet.action");
        $("#mainForm").submit();
    }
    else {
        alert("数据不能为空");
    }
}