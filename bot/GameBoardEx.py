#!/usr/bin/env python2
# Copyright (C) 2018  Anthony Brunetti

from core import dispatcher
from GameBoardExpert import  GameBoardExpert , TOKEN 


if __name__ == "__main__":
	dispatcher.run(GameBoardExpert, TOKEN)
