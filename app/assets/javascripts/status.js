$(document).ready(function() {
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
    var status = data.status;

    return html =
    '<div class="link ' + status + ' ' + '" id=' + data.id + '>' +
    '<span class="title">' + title + "</span>" + ': ' +
    url + '</div>';
  }

  var appendLink = function(id, html) {
    $(".links-list ul").prepend(
      '<li>' + html + '</li>'
    )
  }
});
