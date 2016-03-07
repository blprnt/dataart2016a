import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

class Note {

  Note() {
    //intialize the minim and an AudioOutput line, or channel
    minim = new Minim(this);
    out = minim.getLineOut();
    // pause time when adding a bunch of notes at once
    // This guarantees accurate timing between all notes added at once.
    out.pauseNotes();
  }

  void play(String letter, int i, float date) {
    // set the tempo for the piece
    float tempo = map(date, 1700, 2015, 10, 80);
    out.setTempo( tempo );
    println(letter, i);
    float startFreq = map(date, 1700, 2015, 20, 200);
    float lowFreq = startFreq;
    int deltaFreq = 20;
    float startPoint = i*0.3;
    float duration = 0.4;
    float vol = 0.2;
    // the first bit all in English note names with octave numbers
    // Capital letters are needed for the notes in English.
    // The notes can also have a series of flats (b) and sharps (#).
    // A4 is 440 Hz in this equal-temperment tuning.   
    if (letter.equals("a")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq, vol ));
      println("aaaaaaa");
    }
    if (letter.equals("b")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*1, vol ));
      println("bbbbbbbb");
    }
    if (letter.equals("c")) {
      out.playNote(startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*2, vol ));
      println("ccccccccc");
    }
    if (letter.equals("d")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*3, vol ));
      println("ddddddd");
    }
    if (letter.equals("e")) {
      out.playNote( startPoint, duration, new ToneInstrument(lowFreq+deltaFreq*4, vol ));
      println("eeeeee");
    }
    if (letter.equals("f")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*5, vol ));
      println("ffffffff");
    }
    if (letter.equals("g")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*6, vol ));
      println("gggggggg");
    }
    if (letter.equals("h")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*7, vol ));
      println("hhhhhhh");
    }
    if (letter.equals("i")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*8, vol ));
      println("iiiiiii");
    }
    if (letter.equals("j")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*9, vol ));
      println("jjjjjjjj");
    }
    if (letter.equals("k")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*10, vol ));
      println("kkkkkkkk");
    }
    if (letter.equals("l")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*11, vol ));
      println("lllllll");
    }
    if (letter.equals("m")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*12, vol ));
      println("mmmmmmm");
    }
    if (letter.equals("n")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*13, vol ));
      println("nnnnnnn");
    }
    if (letter.equals("o")) {
      out.playNote( startPoint, duration, new ToneInstrument(lowFreq+deltaFreq*14, vol ));
      println("oooooooo");
    }
    if (letter.equals("p")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*15, vol ));
      println("pppppppp");
    }
    if (letter.equals("q")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*16, vol ));
      println("qqqqqqqq");
    }
    if (letter.equals("r")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*17, vol ));
      println("rrrrrrrr");
    }
    if (letter.equals("s")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*18, vol ));
      println("sssssssss");
    }
    if (letter.equals("t")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*19, vol ));
      println("ttttttt");
    }
    if (letter.equals("u")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*20, vol ));
      println("uuuuuuuu");
    }
    if (letter.equals("v")) {
      out.playNote( startPoint, duration, new ToneInstrument(lowFreq+deltaFreq*21, vol ));
      println("vvvvvvv");
    }
    if (letter.equals("w")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*22, vol ));
      println("wwwwwww");
    }
    if (letter.equals("x")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*23, vol ));
      println("xxxxxxx");
    }
    if (letter.equals("y")) {
      out.playNote( startPoint, duration, new ToneInstrument(lowFreq+deltaFreq*24, vol ));
      println("yyyyyyy");
    }
    if (letter.equals("z")) {
      out.playNote( startPoint, duration, new ToneInstrument( lowFreq+deltaFreq*25, vol ));
      println("zzzzzzzz");
    }
    if (letter.equals(" ")) {
      out.playNote( startPoint, duration, new ToneInstrument( 0, vol ));
      println("        ");
      //out.setNoteOffset(2);
    }
    // a pause before the music starts
    out.resumeNotes();
    // finally, resume time after adding all of these notes at once.
  }

  void backPlay(int date) {
    println(date);
    float duration = 0.4;
    float vol = 0.5;
    out.pauseNotes();
    for (int i = 0; i< 5; i++) {
      // add some low notes
      out.playNote( 0 + i*2.0, 0.3, new ToneInstrument( 75, vol ) );
      out.playNote( 1.25 + i*2.0, 0.3, new ToneInstrument( 75, vol ) );

      // add some middle notes
      out.playNote( 0.5 + i*2.0, 0.3, new ToneInstrument( 175, vol ) );
      out.playNote( 1.75 + i*2.0, 0.3, new ToneInstrument( 175, vol ) );
    }
    out.resumeNotes();
  }
}