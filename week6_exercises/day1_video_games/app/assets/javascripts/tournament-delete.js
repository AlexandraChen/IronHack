function deleteTournament(event){
	event.preventDefault()
	tournamentId = event.currentTarget.value

	var request = $.ajax({
      url: '/api/tournaments/'+tournamentId,
      type: 'DELETE',
      data: {id: tournamentId},
      success: deleteTournament  
    });

  function deleteTournament (tournament){
    $('[value~=' + tournamentId+ ']').parent().remove()
  }
}