$(document).ready(function() {
  $('div').on('click', '.status', function(event) {
    var link = $(this).parent()[0];
    var data = { id: link.id };
    var url = 'api/v1/links/' + link.id;

    $.ajax({
      method: 'PUT',
      url: url,
      data: data,
      dataType: 'JSON',
      success: updateLinkStatus(data),
      error: function(data){
        alert("Error updating Link " + link.id);
      }
    })
  })

  var updateLinkStatus = function(data) {
    var id = data.id
    var idSelector = $("#" + id);
    updateButton(idSelector);
    idSelector.toggleClass("unread").toggleClass('read');
  }

  var updateButton = function(idSelector) {
    var button = idSelector.children(".status");
    var opposites = {"Mark as Unread":"Mark as Read",
                     "Mark as Read": "Mark as Unread"};
    var newStatus = opposites[button.html()];
    button.html(newStatus)
  }

  var getLinks = $.getJSON('/api/v1/links').then(
    function(response) {
      $.each(response, function(index, link){
        appendFormattedLink(link);
      });
    });


  var appendFormattedLink = function(link) {
    var htmlFormat = formatLink(link)
    appendLink(link.id, html);
  }

  var formatLink = function(data) {
    var title = data.title
    var url = data.url;
    var status = linkStatus(data);

    return html =
    '<div class="link ' + status + ' ' + '" id=' + data.id + '>' +
    '<span class="title">' + title + "</span>" + ': ' +
    url + statusButton(data) + editButton(data) + '</div>';
  }

  var editButton = function(data) {
    return '<a href="/links/' + data.id + '/edit">' +
    '<button class="edit">Edit</button></a>';
  }

  var appendLink = function(id, html) {
    $(".links-list ul").prepend(
      '<li>' + html + '</li>'
    )
  }

  var statusButton = function(data) {
    var status = linkStatus(data);
    var text = statusText(status);
    return '<button class="status" value=' +
      data.id + '>Mark as ' + text + '</button>';
  }

  var linkStatus = function(data) {
    if (data.read) { return 'read' } else { return 'unread' };
  }

  var statusText = function(status) {
    if (status === "read") {return "Unread"} else {return "Read"}
  }

});
