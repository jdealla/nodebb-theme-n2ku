<div class="clearfix post-header">

<div class="post-top">
	<div class="user-avatar">
		<a class="avatar-image" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
			{buildAvatar(posts.user, "sm2x", true, "", "user/picture")}
			<i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>
		</a>
		<a class="username" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.displayname} 
	</div>
	<div class="hidden-xs hidden-sm badges">
	<!-- IMPORT partials/topic/badge.tpl -->
	</div>
	<div class="date-edit">
		<div class="edit-flex">
			<i component="post/edit-indicator" class="fa fa-pencil-square<!-- IF privileges.posts:history --> pointer<!-- END --> edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>
			<span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
				<!-- IF posts.toPid -->
				<a component="post/parent" class="btn btn-xs btn-default" data-topid="{posts.toPid}" href="{config.relative_path}/post/{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></a>
				<!-- ENDIF posts.toPid -->
			</span>
		</div>
    	<small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>
		<span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
			<a class="permalink" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>
		</span>
	</div>
</div>

<div class="hidden-md hidden-lg badges">
	<!-- IMPORT partials/topic/badge.tpl -->
</div>


</div>

<br />

<div class="content" component="post/content" itemprop="text">
	{posts.content}
</div>

<div class="post-footer">
	{{{ if posts.user.signature }}}
	<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
	{{{ end }}}

	<div class="clearfix">
	{{{ if !hideReplies }}}
	<a component="post/reply-count" data-target-component="post/replies/container" href="#" class="threaded-replies no-select pull-left {{{ if !posts.replies.count }}}hidden{{{ end }}}">
		<span component="post/reply-count/avatars" class="avatars {{{ if posts.replies.hasMore }}}hasMore{{{ end }}}">
			{{{each posts.replies.users}}}
			{buildAvatar(posts.replies.users, "xs", true, "")}
			{{{end}}}
		</span>

		<span class="replies-count" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
		<span class="replies-last hidden-xs">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

		<i class="fa fa-fw fa-chevron-right" component="post/replies/open"></i>
		<i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
		<i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
	</a>
	{{{ end }}}

	<small class="pull-right">
		<span class="post-tools">
			<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
			<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
		</span>

		<!-- IF !reputation:disabled -->
		<span class="votes">
			<a component="post/upvote" href="#" class="<!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
				<i class="fa fa-chevron-up"></i>
			</a>

			<span component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</span>

			<!-- IF !downvote:disabled -->
			<a component="post/downvote" href="#" class="<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
				<i class="fa fa-chevron-down"></i>
			</a>
			<!-- ENDIF !downvote:disabled -->
		</span>
		<!-- ENDIF !reputation:disabled -->

		<!-- IMPORT partials/topic/post-menu.tpl -->
	</small>
	</div>
	<div component="post/replies/container"></div>
</div>