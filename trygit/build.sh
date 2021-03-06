#!/usr/bin/env bash

# inspired by this script: https://git.io/JYjuQ

# https://elrey.casa/bash/scripting/harden
set -${-//[sc]/}eu${DEBUG+xv}o pipefail

function local_setup(){

  ag -G '.html$' -l --null 'https://d13jv82ekraqyq.cloudfront.net/assets/application-79f3ef8aabbc3e694ddd364138b87eb2.js' | xargs -t -0 sed -i.bak00 -e 's,https://d13jv82ekraqyq.cloudfront.net/assets/application-79f3ef8aabbc3e694ddd364138b87eb2.js,/application-79f3ef8aabbc3e694ddd364138b87eb2.js,g'
  ag -G '.html$' -l --null 'https://d13jv82ekraqyq.cloudfront.net/assets/application-8c99a6177b53973aec4c34bb07a79157.css' | xargs -t -0 sed -i.bak01 -e 's,https://d13jv82ekraqyq.cloudfront.net/assets/application-8c99a6177b53973aec4c34bb07a79157.css,/application-8c99a6177b53973aec4c34bb07a79157.css,g'
  ag -G '.html$' -l --null 'https://try\.github\.io/' | xargs -t -0 sed -i.bak02 -e 's,https://try\.github\.io/,/,g'
  ag -G '.html$' -l --null 'https://d13jv82ekraqyq\.cloudfront\.net/assets/bg-terms-octocat-992475c1d45c413a00492b17924d53ff.png' | xargs -t -0 sed -i.bak03 -e 's,https://d13jv82ekraqyq.cloudfront.net/assets/bg-terms-octocat-992475c1d45c413a00492b17924d53ff.png,/bg-terms-octocat-992475c1d45c413a00492b17924d53ff.png,g'
  ag -G '.html$' -l --null 'https://d13jv82ekraqyq\.cloudfront\.net/assets/badge-course-a3b204c1384a3b43b332f66c5fe9d96b\.png' | xargs -t -0 sed -i.bak04 -e 's,https://d13jv82ekraqyq.cloudfront.net/assets/badge-course-a3b204c1384a3b43b332f66c5fe9d96b.png,/badge-course-a3b204c1384a3b43b332f66c5fe9d96b.png,g'
  ag -l --null -G '\.(js|css)' '//d13jv82ekraqyq.cloudfront.net/assets/' | xargs -0 sed -i.bak00 's,//d13jv82ekraqyq.cloudfront.net/assets/,/,g'

}

function setup_for_local_change(){

  mv -v "${base_dir}/d13jv82ekraqyq.cloudfront.net/assets/"* "${try_git_dir}"
  # mv -v "${base_dir}/cdn.mxpnl.com/libs/mixpanel-2.2.min.js" "${try_git_dir}"
  # rm -rf "${base_dir}"/{cdn.mxpnl.com,d13jv82ekraqyq.cloudfront.net}
  rm -rf "${base_dir}/d13jv82ekraqyq.cloudfront.net"

}

function pull_down_websites(){
  for website in "${website_urls[@]}" ; do
    website_url="$(awk -F'|' '{print $1}' <<< "${website}")"
    website_from="$(awk -F'|' '{print $2}' <<< "${website}")"
    website_to="$(awk -F'|' '{print $3}' <<< "${website}")"
    /usr/local/bundle/bin/wayback_machine_downloader "${website_url}" --from "${website_from}" --to "${website_to}"
  done
}

function main(){
  base_dir='./websites/'
  try_git_dir="${base_dir}/try.github.io"
  website_urls=(
    'https://try.github.io/levels/1/challenges/1|20170109165404|20170109165404'
    'https://try.github.io/|201801|201808'
    'https://d13jv82ekraqyq.cloudfront.net/assets/badge-course-a3b204c1384a3b43b332f66c5fe9d96b.png|20170120003525|20170120003525'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-terms-octocat-992475c1d45c413a00492b17924d53ff.png|20170112094249|20170112094249'
    'https://d13jv82ekraqyq.cloudfront.net/assets/application-79f3ef8aabbc3e694ddd364138b87eb2.js|20171119053553|20171119053553'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Light-webfont-63731c6b9a1ed22a703c44da0c79d93e.eot|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Light-webfont-3c6b94b3bc3ebf4914bed9dbd1109404.woff|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Light-webfont-6c3c2a5b1b51bb5bf34da2eee0124233.ttf|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Regular-webfont-1f215e160863ff5983c29aa9f8848183.eot|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Regular-webfont-c430a5eac9ca173dd443ba437d9aeeb9.woff|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Regular-webfont-3aa3c4724e12479c347df5fd8c5cebf9.ttf|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Bold-webfont-378e7706c6c6dae6279f650496b37eac.eot|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Bold-webfont-901a681123fb0aab4508fce0fad987e9.woff|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/OpenSans-Bold-webfont-90ab8320c64a7bd853933d9b7c63c602.ttf|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/codeschool_logo_brackets-c74cf9011234ff99b9767d3f74bbdb9c.svg|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-bar-7c434475854a4abc243d193cfafffcb7.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-bar-filled-77f1716a0eefdfeceb005135e8a13705.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-link-filled-550b82cbc81eb5f56ff099f1a7b28b86.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-link-front-f6c5f46e278bd96a855ed98aec0c4caa.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-link-front-filled-a52059dd6997db5be183d538bd9abd60.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-link-end-bf00eb481437384c215feb11197e26cb.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-link-end-filled-d929e1d857627ec94c4a1746e7578033.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-progress-link-00feefaa8cd9a07088d1118deeb4b27b.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/logo-course-1fc23c6b16d6feda2bbfc802af9a209f.gif|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-arrow-f773f101189484da3d28b6e1270409f8.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-arrow-f773f101189484da3d28b6e1270409f8.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-control-cbd38af5c0f5d6695fa8da2c9ede1be2.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-close-9701c5138ee5a046693f75cdf4136826.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-home-cf0380418397eacff4a254d99291b73d.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-arrow-right-d4318610d8e2441b6205726010c8ad2d.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-folder-1ff0921f2a28b221ae686087787f1415.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-arrow-right-d4318610d8e2441b6205726010c8ad2d.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-folder-1ff0921f2a28b221ae686087787f1415.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-folder-1ff0921f2a28b221ae686087787f1415.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/bg-terms-octocat-992475c1d45c413a00492b17924d53ff.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/icon-support-f2e4c985f7f5a5bb5bcc057910388e28.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/logo-codeschool-footer-720af602b8823cf152fafd83e3293aac.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/logo-github-footer-3ab916a3190f9ad63418ae5a1608c519.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/sidebar-close-e89587ea30e08cf31c834a086d88bb45.png|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/iframe-dc349ee6bc7c0223142c8a96d1653bd9.js|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/iframe-style.css|201701|201701'
    'https://d13jv82ekraqyq.cloudfront.net/assets/application-8c99a6177b53973aec4c34bb07a79157.css|20170110114657|20170110114657'
  )
  pull_down_websites
  chown -R "$(id -u)":"$(id -g)" "${base_dir}"
  setup_for_local_change
  local_setup
}

# https://elrey.casa/bash/scripting/main
if [[ "${0}" = "${BASH_SOURCE[0]:-bash}" ]] ; then
  main "${@}"
fi
