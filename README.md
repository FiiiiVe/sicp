# sicp
#练习题代码
# 环境
* windows
* 安装racket，配置sicp语法
* 安装配置emacs，spacemacs
* emacs配置geiser，指定racket
# Windows环境搭建
* git
* 安装racket（也可以用别的），<https://download.racket-lang.org/>、
* racket中安装sicp环境，参考 <https://zhuanlan.zhihu.com/p/37056659>
  * File → Package Manager 
  * 在"Do What I Mean" 那一栏里空白框区域输入"sicp"，按回车就会自动安装(挂代理解决所有问题)
  * ``#lang sicp``
* 也可以直接用DrRacket进行编程，但代码提示，高亮代码补全等功能没有（也不是不能用）
* 安装emacs28 <https://www.gnu.org/software/emacs/download.html#nonfree>
* 运行emacs后会在目录``%APPDATA%``下新增``.emacs.d``文件夹
* 安装spacemacs <https://www.spacemacs.org/#>，将下载或git clone的所有文件拷贝到``.emacs.d``文件夹，运行emacs一堆回车后自动安装（可能有些error搜索引擎解决），当然用别人的配置文件也可以
* 可以在安装spacemacs前换源，添加下面的代码到``%APPDATA%/.spacemacs``的``dotspacemacs/user-init ()``中

    ```
      (setq configuration-layer-elpa-archives
            '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
              ("org-cn"   . "http://elpa.emacs-china.org/org/")
              ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
    ```
* ``dotspacemacs/user-config``中添加
    
    ```
      (setq geiser-racket-binary "C:/Program Files/Racket/Racket.exe")
      (setq geiser-active-implementations '(racket))
    ```
  ``dotspacemacs-additional-packages``中添加
      ```
      geiser-racket
      racket-mode
      ```
# 运行
* 打开0.scm，c-x c-w另存为xxx.scm
* c-c c-a打开repl
* c-c c-b运行，repl中运行load会有加载问题,可能要kill repl
# 存在问题
* 如1.2想加载1.1目前没什么好办法
* 
