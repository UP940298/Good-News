var jsonRaw = {
  obj1: { 
    "ID": "1",
    "Title": "Good News",
    "Author": "Thomas Percival",
    "Topic": "Good"
        },
   obj2: { 
    "ID": "2",
    "Title": "Good News",
    "Author": "Thomas Percival",
    "Topic": "Good"
        },
   obj3: { 
    "ID": "3",
    "Title": "Good News",
    "Author": "Marina Bostan",
    "Topic": "Good"
        },
   obj4: { 
    "ID": "4",
    "Title": "Amazing",
    "Author": "Marina Bostan",
    "Topic": "Good"
        },
   obj5: { 
    "ID": "5",
    "Title": "Fantastic",
    "Author": "Gizmo Percival",
    "Topic": "Good"
        },
   obj6: { 
    "ID": "6",
    "Title": "Wow",
    "Author": "Gizmo Percival",
    "Topic": "Good"
        },
};

var jsonStr = JSON.stringify(jsonRaw);

document.getElementById('jsonDisplay').innerHTML = jsonStr;
