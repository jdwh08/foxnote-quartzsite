---
aliases: 
tags:
  - periodicNote/daily
  - private/planner
edited: 2025-02-15T16:21
created: 2024-03-19T22:06
---
----------
#periodicNote/daily
##### <<[[<% tp.date.yesterday("YYYY-MM-DD") %> ]]| [[<% tp.date.tomorrow("YYYY-MM-DD") %>]]>>
##### WEEK: [[<% tp.date.now("YYYY-[W]WW")%>]]
##### MONTH: [[<% tp.date.now("YYYY-[M]MM")%>]]
<%*
	let title = tp.file.title;
	if (title.startsWith('Untitled')) {
		title = tp.date.now("YYYY-MM-DD");
		await tp.file.rename(`${title}`);
	}
-%>

---
# Season of... 


## The Long March:


### Daily Goal:


----------
# Eisenhower Matrix
Due: 📅 | Schedule Work: ⏳ | Start Date: 🛫 | 🔁 every | Priority: 🔺⏫🔼🔽⏬️
<https://publish.obsidian.md/tasks/Getting+Started/Dates>
<https://publish.obsidian.md/tasks/Getting+Started/Recurring+Tasks>

### Important & Urgent
<% tp.file.cursor() %>
- [ ] Task 📅 date

```tasks
due today
not done
```
### Important & Not Urgent
- [ ] Task

### Not Important & Urgent
- [ ] Task

### Not Important & Not Urgent
- [ ] Task

---
# Projects



---
# Habits

### Good Habits:
- [ ] Good Habit #GoodHabit

### Bad Habits:
- [ ] Bad Habit #BadHabit


#### Daily Score:


----
# Reflection
#### Moodles: 

---
### Created Today
```dataview
List FROM "" WHERE file.cday = date("<%tp.date.now('YYYY-MM-DD')%>") SORT file.ctime asc
```

### Modified Today
```dataview
List FROM "" WHERE file.mday = date("<%tp.date.now('YYYY-MM-DD')%>") SORT file.mtime desc
```

### Tasks Done
```tasks
done on today
```

