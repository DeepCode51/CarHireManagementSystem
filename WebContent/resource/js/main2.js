$(function(){
    $('.btn-default').on('click',function(){
        $('#myModal').modal({backdrop: 'static', keyboard: false})
    });

    $('#myModal').on('hidden.bs.modal', function (e) {
        $('#edit_form')[0].reset();
    });
    $('#sub_btn').on('click',function getVal(){
        var name = $('#name').val();
        var content = $('#content').val();

        alert(name+"\n"+content);
        $('#myModal').modal('hide');
    });
});

