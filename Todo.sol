//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract ToDoList{
    struct ToDo{
        string text;
        bool completed;
    }
    ToDo[] public toDos;
    function create(string calldata _text)external{
        toDos.push(ToDo({text:_text, completed:false}));
    }
    function updateText(uint _index, string calldata _text)external{
        toDos[_index].text=_text;
    }
    function get(uint _index) external view returns(string memory, bool){
        ToDo memory todo=toDos[_index];
        return (todo.text,todo.completed);
    }
    function toggleCompleted(uint _index)external{
        toDos[_index].completed=!toDos[_index].completed;
    }
}
