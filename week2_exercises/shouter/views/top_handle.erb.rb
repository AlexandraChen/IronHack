<html>
	<body>
		<center>
			<h1> The Shouter </h1>
			<a href="/"> HOME </a>
			<% if session[:id] != nil %>
				<h3>Shouting as @<%= User.all.find_by(session[:id]).handle %></h3>
				<a href="/shouts"> See all shouts </a>
				<p>Not @<%= User.all.find_by(session[:id]).handle%>? <a href="/logout"> Log out here </a> <p>
			<% end %>
			<br>
			<br>
			<h2> Best shouts </h2>
	
				<% if !Shout.all.empty?  %>

					<% @user_like.each do |user| %>
						<div style="height:100px; width:250px;"> 
							<br>
							<%=User.message%> 
							<br> 
							by @<%= shout.user.handle%>
							<br>					
							<%= shout.created_at %>
							<br>
							<form action="/likes" method="POST">
								<input type="hidden" name="id" value="<%= shout.id %>">
								<input type="submit" name="likes" action="/likes" value="Likes: <%= shout.likes %>">
							</form>
						</div>
					<% end %>
				<% else %>
					<h3>No shouts to display</h3>
				<% end %>

			<br><br><br>
			
			<a href="/logout"> Log out </a>

			</center>
	</body>
</html>