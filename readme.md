<h1 align="center">
  <a href="https://github.com/your-repo">
    <img src="https://www.freeiconspng.com/thumbs/email-icon/email-icon--endless-icons-20.png" alt="Logo" width="" height="">
  </a>
</h1>

<div align="center">
  <b>File Converter</b> - A versatile script to convert individual files or entire folders to the desired format.
  <br />
  <br />
  <a href="https://github.com/your-repo/issues/new?assignees=&labels=bug&title=bug%3A+">Report a Bug</a>
  ·
  <a href="https://github.com/your-repo/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
</div>
<br>
<details open="open">
<summary>Table of Contents</summary>

- [About](#about)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Running on Docker Compose](#running-on-docker-compose)
- [Enviorment Variables Explained](#environment-variables-explained)
- [Getting Started](#getting-started)
    - [Usage](#usage)
    - [Options](#options)
- [Contributing](#contributing)
- [License](#license)

</details>
<br>

---

## About

**File Converter** is a command-line script designed to handle individual files or entire directories, converting them to a specified format. The script provides an intuitive interface and handles errors gracefully, ensuring a seamless user experience.

---

## Features

- Convert individual files or entire folders
- Supports parallel processing for improved performance
- Error handling to avoid disruptions during conversion
- Options to preview or confirm changes before execution
- Lightweight and easy to integrate into existing workflows

---

## Prerequisites

- **Bash**: Ensure you have Bash installed on your system (version 4.0 or higher).
- **Required Tools**: Install any required tools (e.g., `ffmpeg` for media files, `convert` for image files).


### Running on Docker Compose  
Run on Docker Compose (this is the recommended way) by running the command "docker compose up -d".  
```yaml
services:
  msg-converter:
    build: .
    container_name: msg-converter
    volumes:
      - ./msg-files:/app/msg-files
      - ./converted-messages:/app/converted-messages
    environment:
      # Single file conversion:
      # - msg_path=/app/msg-files/single_test_msg.msg
      # Directory conversion:
      - msg_dir=/app/msg-files
    stdin_open: true
    tty: true
```

## Environment Variables Explained  

- `msg_dir: /app/msg-files`
  - The directory path inside the container where message files are located for conversion.
- `msg_path: /app/msg-files/single_test_msg.msg`
  - The path for a single message file to be converted (can be uncommented for single file conversion).
  
## Volumes Explained  

- `./msg-files:/app/msg-files`
  - Maps the host directory `./msg-files` to the container directory `/app/msg-files`, where the input message files are located.
- `./converted-messages:/app/converted-messages`
  - Maps the host directory `./converted-messages` to the container directory `/app/converted-messages`, where the converted messages will be stored.


### Installation of Dependencies

```bash
# Install ffmpeg (example for Ubuntu):
sudo apt update && sudo apt install ffmpeg -y

# Install ImageMagick (example for Ubuntu):
sudo apt install imagemagick -y
```

---

## Getting Started

### Usage

Download the script and make it executable:

```bash
chmod +x file_converter.sh
```

Run the script with the desired options:

```bash
./file_converter.sh [options]
```

### Options

| Option                     | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| `-f <file_path>`           | Specify the file to convert.                                                |
| `-d <directory_path>`      | Specify the directory containing files to convert.                          |
| `-o <output_format>`       | Define the desired output format (e.g., `mp4`, `png`).                     |
| `-h` or `--help`           | Display usage instructions.                                                 |
| `-p` or `--preview`        | Preview the files to be converted without executing the conversion process. |

#### Example Commands

- Convert a single file:

  ```bash
  ./file_converter.sh -f input.txt -o pdf
  ```

- Convert all files in a directory:

  ```bash
  ./file_converter.sh -d /path/to/folder -o jpg
  ```

- Preview changes without executing:

  ```bash
  ./file_converter.sh -d /path/to/folder -o png -p
  ```

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

Please ensure your contributions adhere to the coding standards and include relevant documentation or examples.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

