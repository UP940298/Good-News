var jsonRaw = [
  {
    "ID": "1",
    "Title": "Good News",
    "Author": "Thomas Percival",
    "Topic": "Good",
    "Date": "21/02/2022",
        },
    { 
    "ID": "2",
    "Title": "Good News",
    "Author": "Thomas Percival",
    "Topic": "Good",
     "Date": "21/02/2022",
        },
    { 
    "ID": "3",
    "Title": "Good News",
    "Author": "Marina Bostan",
    "Topic": "Good",
     "Date": "21/02/2022",
        },
  { 
    "ID": "4",
    "Title": "Amazing",
    "Author": "Marina Bostan",
    "Topic": "Good",
     "Date": "21/02/2022",
        },
    { 
    "ID": "5",
    "Title": "Fantastic",
    "Author": "Gizmo Percival",
    "Topic": "Good",
     "Date": "21/02/2022",
        },
     { 
    "ID": "6",
    "Title": "Wow",
    "Author": "Gizmo Percival",
    "Topic": "Good",
     "Date": "21/02/2022",
     }
];

var jsonStr = JSON.stringify(jsonRaw);

document.getElementById('jsonDisplay').innerHTML = jsonStr;
