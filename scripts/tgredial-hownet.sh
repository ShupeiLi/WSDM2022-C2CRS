#! /usr/bin
# Change n, key

#nhop="2"
#nkey="two"
model="c2crs"
save_path="/root/autodl-fs/${model}/tgredial-hownet"

file1="hownet.txt"
file2="word2id.json"
file1_alias="hownet-${nkey}-hop-kg.txt"
file2_alias="hownet-${nkey}-hop-word2id.json"

data_path="$(pwd)/data/dataset/tgredial/pkuseg"
kg_path="$(pwd)/ali-kg/hownet/${nhop}-hop"
tmp_path="$(pwd)/data"

# move and rename n-hop files
mv "${data_path}/${file1}" "${tmp_path}"
mv "${data_path}/${file2}" "${tmp_path}"
cp "${kg_path}/${file1_alias}" "${data_path}"
mv "${data_path}/${file1_alias}" "${data_path}/${file1}"
cp "${kg_path}/${file2_alias}" "${data_path}"
mv "${data_path}/${file2_alias}" "${data_path}/${file2}"

# create backup folders
mkdir -p log-backup/rec-train
mkdir -p log-backup/rec-eval
mkdir -p log-backup/conv-train
mkdir -p log-backup/conv-eval
mkdir -p model-backup

# run model
# recommendation
# train
. scripts/tgredial/train/tgredial_rec_train.sh
mv log/* log-backup/rec-train
mv "save/$(ls save)" "save/rec-train"
# evaluation
. scripts/tgredial/eval/tgredial_rec_eval.sh
mv log/* log-backup/rec-eval
mv save/rec-train model-backup
rm -r "save/$(ls save)"
mv model-backup/rec-train save

# conversation
# train
. scripts/tgredial/train/tgredial_conv_train.sh
mv log/* log-backup/conv-train
mv save/rec-train model-backup
mv "save/$(ls save)" "save/conv-train"
# evaluation
. scripts/tgredial/eval/tgredial_conv_eval.sh
mv log/* log-backup/conv-eval
mv save/conv-train model-backup

# backup
mkdir -p "${save_path}/${nhop}-hop/"
cp -R log-backup "${save_path}/${nhop}-hop/"
zip -r "tgredial-hownet-${nhop}hop-model.zip" model-backup
mv "tgredial-hownet-${nhop}hop-model.zip" "${save_path}/${nhop}-hop/"

# clean up
sh scripts/clean.sh
rm "${data_path}/${file1}"
rm "${data_path}/${file2}"
mv "${tmp_path}/${file1}" "${data_path}"
mv "${tmp_path}/${file2}" "${data_path}"
