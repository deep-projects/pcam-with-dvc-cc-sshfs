cli:
  baseCommand:
  - dvc-cc-agent
  class: CommandLineTool
  cwlVersion: v1.0
  doc: some descriptions of the package...
  inputs:
    dvc_authentication_json:
      doc: 'A path to json file which contains the dvc authentication. This should
        include the keys: username and password.'
      inputBinding:
        position: 5
      type: File
    dvc_data_dir:
      doc: This is optional parameter. Here you can specify a sshfs folder for the
        "data" folder.
      inputBinding:
        prefix: --data_dir
      type: Directory?
    dvc_file_to_execute:
      doc: This is optional parameter. If this parameter is given it will run "dvc
        repro DVC_FILE_TO_EXECUTE". Is this parameter is not set it will run "dvc
        repro -P"
      inputBinding:
        prefix: --dvc_file_to_execute
      type: string?
    dvc_path_to_working_repository:
      doc: The directory that is used for the dvc script.
      inputBinding:
        position: 7
      type: string
    dvc_servername:
      doc: The servername of the dvc directory.
      inputBinding:
        position: 6
      type: string
    git_authentication_json:
      doc: 'A path to json file which contains the git authentication. This should
        include the keys: username. email and password.'
      inputBinding:
        position: 0
      type: File
    git_name_of_tag:
      doc: The source code jumps to this here defined git tag (with git checkout)
        and execute dvc repro there.
      inputBinding:
        position: 4
      type: string
    git_path_to_working_repository:
      doc: The git working directory. With this you can specify what the main git
        root is.
      inputBinding:
        position: 1
      type: string
    git_working_repository_name:
      doc: The git repository name.
      inputBinding:
        position: 3
      type: string
    git_working_repository_owner:
      doc: The name of the owner of the git repository which you want to execute.
      inputBinding:
        position: 2
      type: string
  outputs: {}
container:
  engine: nvidia-docker
  settings:
    gpus:
      count: 1
    image:
      auth:
        password: '{{cbmi_password}}'
        username: '{{cbmi_username}}'
      url: dckr.f4.htw-berlin.de/deepprojects/dvc_repro_starter_tf2.alpha:dev
    ram: 131072
execution:
  engine: ccagency
  settings:
    access:
      auth:
        password: '{{agency_password}}'
        username: '{{agency_username}}'
      url: https://agency.f4.htw-berlin.de/cc
    batchConcurrencyLimit: 12
    retryIfFailed: false
redVersion: '7'
