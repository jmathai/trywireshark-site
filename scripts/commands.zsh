# $1 -> file path
# $2 -> file name (minus extension)
# $_ -> path to current file if sourced
#

export TW_PATH=${0:A:h:h}
export TW_IMAGE_PATH="${TW_PATH}/assets/image/custom"
tw_resize() {
  file=$1
  ext=$file:t:e
  name=$2
  check_path="${TW_IMAGE_PATH}/${name:l}-thumbnail.${ext}"
  echo $TW__IMAGE_PATH
  if [ -f "$file" ] && [ ! -f "$check_path" ] && [ "$name" != "" ]; then
    echo "Resizing $1"
    sizes=('thumbnail' 'medium' 'large' 'extralarge')
    for s in $sizes; do
      image_name="${name:l}-$s"
      echo "Creating ${image_name}.${ext}"
      case $s in
        thumbnail)
          dimensions='256x256';;
        medium)
          dimensions='512x512';;
        large)
          dimensions='1280x1280';;
        extralarge)
          dimensions='2048x2048';;
        *) ;;
      esac
      convert $file -resize $dimensions -density 72 -quality 75 "${TW_IMAGE_PATH}/${image_name}.${ext}"
    done
  else
    echo "File does not exist: $file"
    echo "Or file already exists: $name"
    echo "Or name is empty: $name"
  fi
}
