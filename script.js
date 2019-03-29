
$('#ex-datatables-basic').dataTable({
    pageLength: 10,
    processing: true,
    pagingType: 'full_numbers',
    orderMulti: 'true',
    order: [
            [3, 'asc'],
            [2, 'asc']
    ]
});
