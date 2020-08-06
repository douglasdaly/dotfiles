# scm theming
SCM_THEME_PROMPT_PREFIX="${green}|"
SCM_THEME_PROMPT_SUFFIX="${normal}"

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
SCM_GIT_CHAR="${green}±${normal}"
SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

VIRTUALENV_THEME_PROMPT_PREFIX="${orange}("
VIRTUALENV_THEME_PROMPT_SUFFIX=")${normal} "

scm_prompt() {
    CHAR=$(scm_char)
    if [ $CHAR = $SCM_NONE_CHAR ]
        then
            return
        else
            echo "${green}[${normal}$(scm_char)$(scm_prompt_info)${green}]${normal}"
    fi
}

custom_prompt() {
    ps_user="${bold_green}\u${normal}";
    ps_host="${bold_blue}\h${normal}";
    ps_root="${bold_red}\u${red}";
    ps_root_mark="${red}\n# ${normal}"
    ps_path="${yellow}\w${normal}";
    ps_user_mark="\n${green}$ ${normal}";

    # make it work
    case $(id -u) in
        0)
          PS1="$(virtualenv_prompt)$ps_root${white}@${normal}$ps_host$(scm_prompt)${white}:${normal}$ps_path$ps_root_mark"
            ;;
        *) PS1="$(virtualenv_prompt)$ps_user${white}@${normal}${normal}$ps_host$(scm_prompt)${white}:${normal}$ps_path$ps_user_mark"
            ;;
    esac
}

safe_append_prompt_command custom_prompt
