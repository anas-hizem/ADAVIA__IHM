#include <pybind11/pybind11.h>
#include <pybind11/embed.h>

namespace py = pybind11;
using namespace py::literals;

void start_person_detection(const std::string& video_path) {
    py::scoped_interpreter guard{}; // Start the interpreter
    py::object person_detection = py::module_::import("personDetection");
    py::object main_func = person_detection.attr("main");
    main_func();
}

PYBIND11_MODULE(person_detection_wrapper, m) {
    m.def("start_person_detection", &start_person_detection, "Start person detection");
}
