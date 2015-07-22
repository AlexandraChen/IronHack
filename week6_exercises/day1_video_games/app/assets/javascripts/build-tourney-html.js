function buildTourneyHtml (tournament) {
  return '\
    <li>\
      <a href="/tournaments/' + tournament.id + '">' + tournament.name + '</a>\
    	<button type="submit" class="btn btn-success" data-hook = "tourney-delete" value="'+tournament.id+'"> KABOOM!</button>\
    </li>\
  '
}