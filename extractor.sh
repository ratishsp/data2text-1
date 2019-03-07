#!/usr/bin/env bash


#├── PROJECT_DIR
#   ├── models
#   │   ├── models     (MODEL_DIR)
#   │   └── ie_models  (LUA_MODEL_DIR)
#   ├── data2text-plan-py (D2T_CODE_DIR)
#   │   └── data2text-1 (LUA_DIR)
#   └── boxscore-data  (BOXSCORE_DIR)
#       └── rotowire   (ROTOWIRE_DIR)

export LUA_DIR=${PWD}
export D2T_CODE_DIR="$(dirname "LUA_DIR")"
export PROJECT_DIR="$(dirname "D2T_CODE_DIR")"

export BOXSCORE_DIR=$PROJECT_DIR/boxscore-data
export PREPROCESS_DIR=$BOXSCORE_DIR/preprocess
export ROTOWIRE_DIR=$BOXSCORE_DIR/rotowire

export LUA_MODEL_DIR=$PROJECT_DIR/models/ie_models
export MODEL_DIR=$PROJECT_DIR/models/models
export OUTPUT_H5=$ROTOWIRE_DIR/roto-ie.h5
export DIC_PREFIX=$ROTOWIRE_DIR/roto-ie
export LUA_FILE=$LUA_DIR/extractor.lua

cd $LUA_DIR

th $LUA_FILE \
-datafile $OUTPUT_H5 \
-preddata $MODEL_DIR/roto_stage2_$IDENTIFIER-beam5_gens.h5 \
-savefile $MODEL_DIR/roto_stage2_$IDENTIFIER-beam5_gens.h5-tuples.txt \
-dict_pfx $DIC_PREFIX \
-just_eval \
-convens_paths1 $LUA_MODEL_DIR/conv1-ep10-94-73 \
-convens_paths2 $LUA_MODEL_DIR/conv2-ep10-95-71 \
-convens_paths3 $LUA_MODEL_DIR/conv3-ep10-94-71 \
-lstmens_paths1 $LUA_MODEL_DIR/lstm1-ep5-92-76 \
-lstmens_paths2 $LUA_MODEL_DIR/lstm2-ep4-93-74 \
-lstmens_paths3 $LUA_MODEL_DIR/lstm3-ep10-90-78
