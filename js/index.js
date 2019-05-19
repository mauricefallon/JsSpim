const outputDOM = document.getElementById('output-content');
const logDOM = document.getElementById('log-content');

var Module = {
    onRuntimeInitialized: main,
    print: (text) => {
        outputDOM.innerHTML += text + "\n";
        outputDOM.scrollTop = outputDOM.scrollHeight;
    },
    printErr: (text) => {
        logDOM.innerHTML += text + "\n";
        logDOM.scrollTop = outputDOM.scrollHeight;
    },
    totalDependencies: 0,
    monitorRunDependencies: function (left) {
        this.totalDependencies = Math.max(this.totalDependencies, left);
    },
};

let Spim;

async function main(fileInput = 'https://raw.githubusercontent.com/ShawnZhong/JsSpim/dev/Tests/fib.s') {
    let data = await loadData(fileInput);

    const stream = FS.open('input.s', 'w+');
    FS.write(stream, new Uint8Array(data), 0, data.byteLength, 0);
    FS.close(stream);

    Spim = {
        init: cwrap('init'),
        run: cwrap('run'),
        step: cwrap('step', 'bool'),
        getUserData: cwrap('getUserData', 'string'),
        getUserText: cwrap('getUserText', 'string'),
        getKernelText: cwrap('getKernelText', 'string'),
        getKernelData: cwrap('getKernelData', 'string'),
        getUserStack: cwrap('getUserStack', 'string'),
        addBreakpoint: cwrap('addBreakpoint', null, 'number'),
        deleteBreakpoint: cwrap('deleteBreakpoint', null, 'number'),
    };

    outputDOM.innerHTML = "";
    logDOM.innerHTML = "";

    Spim.init();
    
    RegisterUtils.init();
    MemoryUtils.init();
}

async function loadData(fileInput) {
    if (fileInput instanceof File) { // local file
        const reader = new FileReader();
        return await new Promise((resolve) => {
            reader.onload = () => resolve(reader.result);
            reader.readAsArrayBuffer(fileInput);
        });
    } else { // remote file
        const response = await fetch(fileInput);
        return await response.arrayBuffer();
    }
}