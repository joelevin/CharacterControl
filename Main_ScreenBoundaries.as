﻿package{	import flash.display.MovieClip;	import flash.events.KeyboardEvent;	import flash.ui.Keyboard;	import flash.events.Event;	public class Main_ScreenBoundaries extends MovieClip	{		var vx:int;		var vy:int;		public function Main_ScreenBoundaries()		{			init();		}		function init():void		{			//initialize variables			vx = 0;			vy = 0;			//Add event listeners			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);			addEventListener(Event.ENTER_FRAME, onEnterFrame);		}		function onKeyDown(event:KeyboardEvent):void		{			if (event.keyCode == Keyboard.LEFT)			{				vx = -5;			}			else if (event.keyCode == Keyboard.RIGHT)			{				vx = 5;			}			else if (event.keyCode == Keyboard.UP)			{				vy = -5;			}			else if (event.keyCode == Keyboard.DOWN)			{				vy = 5;			}		}		function onKeyUp(event:KeyboardEvent):void		{			if (event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT)			{				vx = 0;			}			else if (event.keyCode == Keyboard.DOWN || event.keyCode == Keyboard.UP)			{				vy = 0;			}		}		function onEnterFrame(event:Event):void		{			//Initialize local variables			var playerHalfWidth:uint = player.width / 2;			var playerHalfHeight:uint = player.height / 2;			//Move the player			player.x += vx;			player.y += vy;			//Stop player at stage edges			if (player.x + playerHalfWidth > stage.stageWidth)			{				player.x = stage.stageWidth - playerHalfWidth;			}			else if (player.x - playerHalfWidth < 0)			{				player.x = 0 + playerHalfWidth;			}			if (player.y - playerHalfHeight < 0)			{				player.y = 0 + playerHalfHeight;			}			else if (player.y + playerHalfHeight > stage.stageHeight)			{				player.y = stage.stageHeight - playerHalfHeight;			}		}	}}