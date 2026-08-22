if [[ -n "$(echo $XDG_CURRENT_DESKTOP | awk '/GNOME/')" ]]; then
    alias toggle-animations='gsettings set org.gnome.desktop.interface enable-animations \
        $(if [[ "$(gsettings get org.gnome.desktop.interface enable-animations)" == "true" ]]; \
        then echo "false"; else echo "true"; fi)'
fi

mvn-new() {
    local artifact="$1"
    local group="${2:-com.example}"

    if [[ -z "$artifact" ]]; then
        echo "Usage: mvn-new <artifactId> [groupId]"
        return 1
    fi

    mvn archetype:generate \
        -DgroupId="$group" \
        -DartifactId="$artifact" \
        -DarchetypeGroupId=org.apache.maven.archetypes \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.5 \
        -DinteractiveMode=false

    if [[ -d "./$artifact" ]]; then
        git init "./$artifact"
        local gitignore=(".classpath" ".mvn/" ".project" ".settings/" "target/")
        printf '%s\n' "${gitignore[@]}" > "./$artifact/.gitignore"
    fi
}
