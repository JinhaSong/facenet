## 출처 
- 해당 디렉토리에 있는 코드의 출처는 아래 링크이다.<br>(The source of the code in this directory is the following link.)
- __Link__ : [https://github.com/gitarya/facenet/tree/generate_pairs/src/pair](https://github.com/gitarya/facenet/tree/generate_pairs/src/pair)

## 1. Organize your dataset
- VGGFace2의 dataset의 구조는 다음과 같다.
```
${Workspace}/VGGFace2/train/
├── n000001
│   ├── 0006_01.png
│   ├── 0008_01.png
│   ├── 0009_01.png
...
├── n000029
│   ├── 0006_01.png
│   ├── 0008_01.png
│   ├── 0009_01.png
...
...
```
- pairs.txt를 생성하기 위해 LFW dataset과 같은 형식으로 validation set을 rename한다.
```
python rename.py ${Validation_data_dir} ${Rename_validation_data_dir}
```

## 2. Align the dataset
- Validation dataset을 학습 데이터와 동일하게 align한다.  
```
python src/align/align_dataset_mtcnn.py \
${Source:Rename_validation_data_dir} \
${Target:Rename_validation_data_align_dir} \
--image_size 160 \
--margin 32 \
--random_order \
--gpu_memory_fraction 0.25
```

## 3. Generate the pairs.txt
- Align한 validation dataset을 이용하여 match pair와 mismatch pair에 대한 list를 pairs.txt에 생성한다.
```
python generate_path.py ${Rename_validation_data_align_dir} ${Path_of_pairs.txt}
```
