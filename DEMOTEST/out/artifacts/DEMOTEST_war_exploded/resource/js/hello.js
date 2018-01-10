function deleteBatch() {
    //$("#mainForm") =document.getElementById('light')
    $("#mainForm").attr("action","/DeleteBatchServlet.action");
    $("#mainForm").submit();

}
