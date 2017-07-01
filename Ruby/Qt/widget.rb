#!/usr/bin/ruby

# ZetCode Ruby Qt tutorial
#
# This program uses toggle buttons to
# change the background colour of
# a widget.
#
# author: Jan Bodnar
# website: www.zetcode.com
# last modified: September 2012

require 'Qt'


class QtApp < Qt::Widget

    slots 'on_clicked()'

    def initialize
        super
        
        setWindowTitle "Toggle button"
       
        init_ui
       
        resize 300, 180
        move 300, 300

        show
    end
    
    def init_ui

        @color = Qt::Color.new 0, 0, 0

        setGeometry 300, 300, 280, 170
        setWindowTitle "ToggleButton"

        @redb = Qt::PushButton.new 'Red', self
        @redb.setCheckable true
        @redb.move 10, 10

        connect @redb, SIGNAL("clicked()"), SLOT("on_clicked()")
        
        @greenb = Qt::PushButton.new 'Green', self
        @greenb.setCheckable true
        @greenb.move 10, 60

        connect @greenb, SIGNAL('clicked()'), SLOT("on_clicked()")

        @blueb = Qt::PushButton.new "Blue", self
        @blueb.setCheckable true
        @blueb.move 10, 110

        connect @blueb, SIGNAL("clicked()"), SLOT("on_clicked()")
        @square = Qt::Widget.new self
        @square.setGeometry 150, 20, 100, 100
        @square.setStyleSheet "QWidget { background-color: %s }" % @color.name
    end
    
    def on_clicked
        red = @color.red
        green = @color.green
        blue = @color.blue
        
        if @redb.isChecked
            red = 255
        else 
            red = 0
        end
  
        if @greenb.isChecked
            green = 255
        else 
            green = 0
        end

        if @blueb.isChecked
            blue = 255
        else 
            blue = 0
        end
        
        @color = Qt::Color.new red, green, blue

        @square.setStyleSheet("QWidget { background-color: %s }" % @color.name) 
    end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec