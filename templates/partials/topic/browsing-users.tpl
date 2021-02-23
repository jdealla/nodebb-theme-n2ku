<div component="topic/browsing-users" class="browsing-users-container">
	{{{each browsingUsers}}}
	<div class="browsing-user-container" data-uid="{browsingUsers.uid}">
		<a href="<!-- IF browsingUsers.userslug -->{config.relative_path}/user/{browsingUsers.userslug}<!-- ELSE -->#<!-- ENDIF browsingUsers.userslug -->">
			<!-- IF browsingUsers.picture -->
			<img class="avatar avatar-sm avatar-rounded" component="user/picture" src="{browsingUsers.picture}" align="left" itemprop="image" title="{browsingUsers.username}"/>
			<!-- ELSE -->
			<div class="avatar avatar-sm avatar-rounded" component="user/picture" title="{browsingUsers.username}" style="background-color: {browsingUsers.icon:bgColor};">{browsingUsers.icon:text}</div>
			<!-- ENDIF browsingUsers.picture -->
		</a>
	</div>
	{{{end}}}
</div>