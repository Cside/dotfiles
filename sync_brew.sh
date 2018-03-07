#!/bin/bash -x
brew list | sort | xargs -L 1 echo > brew
