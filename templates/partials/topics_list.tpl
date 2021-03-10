<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
	<meta itemprop="itemListOrder" content="descending">
	{{{each topics}}}
	<li component="category/topic" class="row clearfix category-item {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<a id="{../index}" data-index="{../index}" component="topic/anchor"></a>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="col-md-1 col-sm-2 content hidden-xs">
			<div class="avatar pull-left">
				<!-- IF showSelect -->
				<div class="select" component="topic/select">
					<!-- IF topics.thumb -->
					<img src="{topics.thumb}" class="user-img not-responsive" />
					<!-- ELSE -->
					{buildAvatar(topics.user, "46", true, "not-responsive")}
					<!-- ENDIF topics.thumb -->
					<i class="fa fa-check"></i>
				</div>
				<!-- ENDIF showSelect -->

				<!-- IF !showSelect -->
				<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
					<!-- IF topics.thumb -->
					<img src="{topics.thumb}" class="user-img not-responsive" />
					<!-- ELSE -->
					{buildAvatar(topics.user, "46", true, "not-responsive")}
					<!-- ENDIF topics.thumb -->
				</a>
				<!-- ENDIF !showSelect -->
			</div>
		</div>


		<div class="col-md-4 col-sm-5 col-xs-5 content">
			


			<!-- IF !topics.noAnchor -->
			<h2>
			<i style="margin-right: 3px;" component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="{{{ if !../pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {../pinExpiryISO}]]{{{ end }}}"></i>
			<i style="margin-right: 3px;" component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
			<i style="margin-right: 3px;" component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
			{{{each topics.icons}}}{@value}{{{end}}}
			<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a>
			</h2><br />
			<span class="hidden-sm hidden-md hidden-lg">

				<a class="recent-category" href="{config.relative_path}/category/{topics.category.slug}" style="color: {topics.category.bgColor}">
					{topics.category.name}
				</a>
			</span>
			<!-- ELSE -->
			<span>{topics.title}</span><br />
			<!-- ENDIF !topics.noAnchor -->
		</div>

		<div class="col-md-1 col-sm-2 hidden-xs">

			<a class="recent-category" href="{config.relative_path}/category/{topics.category.slug}">
				{topics.category.name}
			</a>
		</div>

		<div class="mobile-stat col-xs-2 visible-xs" style="padding-top: 0px;">
			<div class="mobile-stat-flex">
				<span class="human-readable-number"></i>{topics.postcount}</span> 
			</div>
		</div>

		<div class="col-md-1 hidden-sm hidden-xs stats stats-votes">
			<!-- IF !reputation:disabled -->
			<span class="human-readable-number" title="{topics.votes}">{topics.votes}</span><br />
			<small>[[global:votes]]</small>
			<!-- END -->
		</div>

		<div class="col-md-1 hidden-sm hidden-xs stats stats-postcount">
			<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span><br />
			<small>[[global:posts]]</small>
		</div>

		<div class="col-md-1 hidden-sm hidden-xs stats stats-viewcount">
			<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span><br />
			<small>[[global:views]]</small>
		</div>

		<div class="col-md-3 col-sm-3 teaser hidden-xs" component="topic/teaser">
			<div class="card" style="border-color: {topics.category.bgColor}">
				<!-- IF topics.unreplied -->
				<p>
					[[category:no_replies]]
				</p>
				<!-- ELSE -->
				<!-- IF topics.teaser.pid -->
				<p>
					<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">{buildAvatar(topics.teaser.user, "24", true, "not-responsive")}</a>
					<a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
						<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					</a>
				</p>
				<div class="post-content">
					{topics.teaser.content}
				</div>
				<!-- ENDIF topics.teaser.pid -->
				<!-- ENDIF topics.unreplied -->
				{debug}
			</div>
		</div>

		<div class="hidden-sm hidden-md hidden-lg col-xs-2 no-padding">
			<!-- IF topics.teaser.pid -->
			<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">{buildAvatar(topics.teaser.user, "24", true, "not-responsive")}</a>
			<!-- ENDIF topics.teaser.pid -->
		</div>

		<div class="hidden-sm hidden-md hidden-lg col-xs-2 no-padding">
			<!-- IF topics.unreplied -->
			<span class="mobile-teaser">
				No Replies
			</span>
			<!-- ELSE -->
			<!-- IF topics.teaser.pid -->
			<a class="permalink mobile-teaser" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
				<span class="timeago" title="{topics.teaser.timestampISO}"></span>
			</a>
			<!-- ENDIF topics.teaser.pid -->
			<!-- ENDIF topics.unreplied -->
		</div>
	</li>
	{{{end}}}
</ul>
