// JavaScript implementation for creating a consistent character creation table.
// This script mirrors the functionality of the original HTML+JS combined code, modularizing it.

class CharacterTableCreator {
    constructor(seed) {
        this.seedNumber = seed || Math.floor(10000 + Math.random() * 90000);
        this.sceneData = [];
    }

    initializeUI() {
        console.log(`Your seed number for the scenes is: ${this.seedNumber}`);
        this.character = prompt("Enter character name:", "");
        this.characterDescription = prompt("Enter character description:", "");

        const sceneCount = parseInt(prompt("How many scenes do you need? (1-9):", ""), 10);
        if (isNaN(sceneCount) || sceneCount < 1 || sceneCount > 9) {
            alert('Please enter a valid number of scenes (1-9).');
            return;
        }

        for (let i = 1; i <= sceneCount; i++) {
            const location = prompt(`Enter location for Scene ${i}:`, "");
            const action = prompt(`Enter action for Scene ${i}:`, "");
            this.sceneData.push({ scene: `Scene ${i}`, location, action });
        }

        this.createTable();
    }

    createTable() {
        const table = document.createElement('table');
        table.style.borderCollapse = 'collapse';
        table.style.width = '100%';
        table.style.marginBottom = '20px';

        const headerRow = document.createElement('tr');
        ['Scene Number', 'Prompt'].forEach(header => {
            const th = document.createElement('th');
            th.style.border = '1px solid black';
            th.style.padding = '10px';
            th.textContent = header;
            headerRow.appendChild(th);
        });
        table.appendChild(headerRow);

        this.sceneData.forEach((scene, index) => {
            const row = document.createElement('tr');

            const sceneCell = document.createElement('td');
            sceneCell.style.border = '1px solid black';
            sceneCell.style.padding = '10px';
            sceneCell.textContent = scene.scene;
            row.appendChild(sceneCell);

            const promptCell = document.createElement('td');
            promptCell.style.border = '1px solid black';
            promptCell.style.padding = '10px';
            promptCell.textContent = `seed number [${this.seedNumber}] ${this.character} ${this.characterDescription} ${scene.action} ${scene.location}`;
            row.appendChild(promptCell);

            table.appendChild(row);
        });

        document.body.appendChild(table);

        const copyButton = document.createElement('button');
        copyButton.textContent = 'Copy Table';
        copyButton.onclick = () => this.copyTable(table);
        document.body.appendChild(copyButton);
    }

    copyTable(table) {
        const range = document.createRange();
        range.selectNode(table);
        const selection = window.getSelection();
        selection.removeAllRanges();
        selection.addRange(range);

        try {
            document.execCommand('copy');
            alert('Table copied to clipboard!');
        } catch (err) {
            alert('Failed to copy table.');
        }

        selection.removeAllRanges();
    }
}

// Instantiate and start the process.
const tableCreator = new CharacterTableCreator();
tableCreator.initializeUI();
