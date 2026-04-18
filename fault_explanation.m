function explanation = fault_explanation(faultType)
%FAULT_EXPLANATION  Returns explanation text for each fault type.

    switch lower(faultType)
        case 'normal'
            explanation = 'No anomaly detected. Fiber link healthy.';
        case 'cut'
            explanation = 'Fiber cut detected — complete loss beyond break point.';
        case 'bend'
            explanation = 'Fiber bend detected — local reflection and gradual attenuation.';
        case 'splice'
            explanation = 'Splice loss or poor connection detected — minor reflection observed.';
        otherwise
            explanation = 'Unknown fault type.';
    end
end
