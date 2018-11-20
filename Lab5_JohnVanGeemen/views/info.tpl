% rebase('layout.tpl', title='Info', year=2018)
<!--{{blog_info["_id"]}}-->


<h1>{{blog_info["post_title"]}}</h1>
<h5>{{blog_info["post_date"]}}</h5>
<p>{{blog_info["post_text"]}}</p>

<h3>Tags</h3>
<ul>

%if blog_info["post_tags"] != None:
	%for i in blog_info["post_tags"]:
	<li>{{i}}</li>
	%end
		%else:
		<li>None</li>
	%end
%end
</ul>