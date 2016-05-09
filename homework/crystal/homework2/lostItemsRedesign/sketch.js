/* 
A remix of Will Field's lost assignment
https://github.com/blprnt/dataart2016a/tree/master/homework/lost
*/

var data
var lostItems
var grayscale
var test
var f = new Array();
var x = 50;
var y = 50;
var size
var maxy
var lost0 = true;
var twisted
var gray
var graying = 0;
var n
var i

function preload() {
  data = loadJSON("lostitems.json"); 
}

function setup() {
  createCanvas(700, 800);
  background(255);
  noLoop();
  noStroke();
  lostItems = data[0].Category;
}

function draw() {
  pickLostItem();
  writeCategory();
  saveImg();
}




function pickLostItem() {
  n=random(lostItems.length);
  n=int(n);
  getLostItems();
}

function getLostItems() {
/* CATEGORIES */
  for (i=n; i < lostItems.length; i++) {
/* thanks @ http://www.javascripter.net/faq/twodimensional.htm */
    f[i] = new Array();
/* SUBCATEGORIES */
    for (j = 0; j < lostItems[i].SubCategory.length; j++) {
      test = lostItems[i].SubCategory[j].count;
      append(f[i],test);
    }
    f[i].sort(sortNumber);
    //console.log(f[i].join(","));
    for (k = 0; k < lostItems[i].SubCategory.length; k++) {
      if(lost0 == true) {
        increaseColor();
        drawLostItems();
      }
    }
    lost0 = false;
  }
  console.log(n);
}

/* holla @ http://stackoverflow.com/questions/1063007/how-to-sort-an-array-of-integers-correctly */
function sortNumber(a,b) {
  return a - b;
}

function drawLostItems() {
  var rectCorner = 15;
  maxy = f[i].length-1;
  twisted = reverse(f[i]);
  size = map(twisted[k], f[i][maxy], f[i][0], 100, width-100);
  intSize = int(size);
  fill(gray);
  //the 2 largest subcategories in category 22 are almost equal
  if (i == 22 && k < 2) {
    rect(x, y, size, size, 0, rectCorner, rectCorner, rectCorner);
  }
  else if (k == 0){
    rect(x, y, size, size, 0, rectCorner, rectCorner, rectCorner);  
  }
  else {
    rect(x, y, size, size, 0, 0, rectCorner, 0);
  }
  twisted = reverse(f[i]);
}

function increaseColor() {
  grayscale = (255/f[i].length+1);
  graying++;
  gray = grayscale * graying;
  gray = int(gray);
}

function writeCategory() {
  textSize(16);
  textAlign(RIGHT);
  fill(0);
  text("LOST  "+lostItems[n].Category, width-x, height-y/2);
}

function saveImg() {
  save('lost'+lostItems[n].Category+'.jpg');
}






  
  
/**** A History of my Misery ****/
// var lostCategories
// var lostSubCategories
// var lostCount
// var variables
// var variablesss = [];
// var subCategories = [];
// var counting = [];
// var arrays
// var minimum = 1;
// var maximum = 38346

// function draw() {
  // chooseLostItem();
  //getLostItems();
  // // console.log(lostItems.length);
  // /* CATEGORIES */
  // for (i = 0; i < lostItems.length; i++) {
  //   // console.log(lostItems[i].Category);
  //   // console.log(lostItems[i].SubCategory.length);
  //   var variable = new Array(lostItems.length);
    
  //   print(variable);

    
  // /* SUBCATEGORIES */
  //   for (j = 0; j < lostItems[i].SubCategory.length; j++) {
  //     console.log(lostItems[i].SubCategory[j]);
  //     // console.log(lostItems[i].SubCategory[j].count);
  //     // lostSubCategories = lostItems[i].SubCategory[j].SubCategory;
  //     //lostCount = lostItems[i].SubCategory[j].count;
  //     /*make a new array of counts for each subCategory*/

  //     // var counting = 'counting' +j;
  //     // counting = [];
  //     //counting.push(lostCount);
  //     //console.log(counting);
  //     //sort (lostItems[i].SubCategory[j].count,lostItems[i].SubCategory[j].length);
  //     // variablesss[j] = "walter";
  //     // console.log(variablesss[j]);
  //     // variables = variablesss[j];
  // //.push(lostCount);

  //     // var variable +j = new Array(lostItems[i].SubCategory.length);
  //     // print(variable +j);
  //     append(variablesss,lostItems[i].SubCategory[j].count);

  //   }
  //     variablesss.sort(sortNumber);
  //     console.log(variablesss.join(","));
  //     console.log(variablesss[3]);
  // }
// }

// function chooseLostItem() {
//   background(255, 0, 0);
//   textAlign(CENTER)
//   text("I lost my", width/2, height/2 - 50);
//   pickLostItem();
// }


// function drawLostItems() {
//   maxy = f[i].length-1;
//   // // console.log(maxy);
//   // // console.log(f[i][k]);
//   // // console.log(f[i][0]);
//   // // console.log(f[i][maxy]);
//   // // grayscale = map(twisted[k], f[i][maxy], f[i][0], 255, 0);
//   // grayscale = (255/f[i].length);
//   // console.log(f[i].length);
//   // console.log(grayscale);
//   // gray = int(grayscale);
//   // gray = gray * f[i][i];
//   // console.log(gray);
//   twisted = reverse(f[i]);
//   console.log(twisted);
//   console.log(maxy);
//   console.log(f[i][k]);
//   console.log(f[i][0]);
//   console.log(f[i][maxy]);
//   size = map(twisted[k], f[i][maxy], f[i][0], 100, width-100);
//   intSize = int(size);
//   console.log(intSize);

//   // reverse(f[i]);
//   // console.log(f[i]);
//   fill(gray);
//   // rect(50+((f[i][k])*1), 50+((f[i][k])*1), size, size, 25);
//     rect(50, 50, size, size);
//   twisted = reverse(f[i]);
  
// }

// function increaseColor() {
//   // console.log(maxy);
//   // console.log(f[i][k]);
//   // console.log(f[i][0]);
//   // console.log(f[i][maxy]);
//   // grayscale = map(twisted[k], f[i][maxy], f[i][0], 255, 0);
//   grayscale = (255/f[i].length);
//   // console.log(f[i].length);
//   console.log(grayscale);
//   graying++;
//   console.log(graying);
//   gray = grayscale * graying;
//   gray = int(gray);
//   // gray = int(grayscale);
//   // // gray = gray * f[i][i];
//   // console.log(gray);
//   // graying++;
//   // console.log(graying);
//   // gray = gray * graying;
//   console.log(gray);
// }

// function fade() {
//   gray--;
// }


// function mouseClicked() {
//   if (lost0 == true) {
//     lost0 = false;
//   }
//   else {
//     lost0 = true;
//   }
//   console.log(lost0);
//   return false;
// }

// $(function() {
//   $('#defaultCanvas');
// });
